<?php


namespace Dengarin\Collaboration\Validation;


use DateTime;
use Dengarin\Collaboration\Models\Event;
use Exception;
use Phalcon\Messages\Message;
use Phalcon\Messages\Messages;
use Phalcon\Mvc\Model\Resultset;
use Phalcon\Validation;

class EventValidation extends Validation
{
    private int $type;
    private $sound_user_id;
    const TYPE_AMPLIFIER_CREATE = 1;
    const TYPE_SOUND_CREATE = 2;
    const TYPE_AMPLIFIER_UPDATE = 3;
    const TYPE_SOUND_UPDATE = 4;
    const TYPE_SOUND_ACCEPT = 5;

    public function __construct(int $type, $sound_user_id = null, array $validators = array())
    {
        $this->type = $type;
        $this->sound_user_id = $sound_user_id;
        parent::__construct($validators);
    }

    public function initialize()
    {
        if ($this->type == self::TYPE_AMPLIFIER_CREATE || $this->type == self::TYPE_SOUND_CREATE ||
            $this->type == self::TYPE_AMPLIFIER_UPDATE || $this->type == self::TYPE_SOUND_UPDATE ) {
            $this->add(['name'], new Validation\Validator\PresenceOf([
                'message' => 'Name is required!'
            ]));
            $this->add(['start_date', 'end_date'], new Validation\Validator\Date([
                'format' => 'Y-m-d',
                'message' => 'Invalid date!'
            ]));
            $this->add(['start_time', 'end_time'], new Validation\Validator\Date([
                'format' => 'H:i',
                'message' => 'Invalid time!'
            ]));
        }

        if ($this->type == self::TYPE_SOUND_CREATE || $this->type == self::TYPE_SOUND_UPDATE) {
            $this->add(['status'], new Validation\Validator\InclusionIn([
                'domain' => [0, 1],
                'message' => "Invalid status!"
            ]));
        }
        if (!($this->type == self::TYPE_AMPLIFIER_CREATE || $this->type == self::TYPE_SOUND_CREATE)) {
            $this->add(['id'], new Validation\Validator\PresenceOf([
                'message' => 'Invalid event!'
            ]));
        }
    }

    public function validate($data = null, $entity = null): Messages
    {
        $errors = parent::validate($data, $entity);

        if (!is_array($data))
            return $errors;

        if ($this->type == self::TYPE_AMPLIFIER_CREATE || $this->type == self::TYPE_SOUND_CREATE || $this->type == self::TYPE_AMPLIFIER_UPDATE ||
            $this->type == self::TYPE_SOUND_UPDATE || $this->type == self::TYPE_SOUND_ACCEPT) {
            try {
                if ($this->type == self::TYPE_SOUND_ACCEPT) {
                    $time_start = $data['time_start'];
                    $time_end = $data['time_end'];
                } else {
                    $time_start = new DateTime($data['start_date'] . ' ' . $data['start_time']);
                    $time_end = new DateTime($data['end_date'] . ' ' . $data['end_time']);
                    if ($time_start >= $time_end)
                        $errors->appendMessage(new Message('Invalid date range!'));

                    $time_start = $time_start->format('Y-m-d H:i:s');
                    $time_end = $time_end->format('Y-m-d H:i:s');
                }

                $bind = [
                    0 => $time_start,
                    1 => $time_end,
                    2 => $time_start,
                    3 => $time_end,
                    4 => $time_start,
                    5 => $time_end,
                    6 => Event::STATUS_FOLLOWED_UP,
                    7 => Event::STATUS_FOLLOWED_UP,
                    8 => Event::STATUS_ACCEPTED,
                    9 => Event::STATUS_ACCEPTED,
                ];

                if ($this->type == self::TYPE_AMPLIFIER_CREATE || $this->type == self::TYPE_SOUND_CREATE){
                    $conditions = '((?0 <= time_start and ?1 >= time_start) 
                                        or (?2 <= time_end and ?3 >= time_end) 
                                        or (?4 >= time_start and ?5 <= time_end)) and status & ?6 = ?7 
                                        and status & ?8 = ?9';
                    if ($this->sound_user_id != null) {
                        $conditions .= ' and sound_user_id = :sound_user_id:';
                        $bind['sound_user_id'] = $this->sound_user_id;
                    }
                } else{
                    /** @var Event $event */
                    $event = Event::findFirst($data['id']);

                    $conditions = 'id != :id: and sound_user_id = :sound_user_id: 
                                        and ((?0 <= time_start and ?1 >= time_start) 
                                        or (?2 <= time_end and ?3 >= time_end) 
                                        or (?4 >= time_start and ?5 <= time_end)) and status & ?6 = ?7 
                                        and status & ?8 = ?9';
                    $bind['id'] = $event->id;
                    $bind['sound_user_id'] = $event->sound_user_id;
                }

                /** @var Resultset $otherEvent */
                $otherEvent = Event::find([
                    'conditions' => $conditions,
                    'bind' => $bind
                ]);

                if ($otherEvent->count()) {
                    $errors->appendMessage(new Message('There are another events at the same time'));
//                    /** @var Event $event */
//                    foreach ($otherEvent as $event) {
//                        $errors->appendMessage(new Message('Event ' . $event->name . ' | ' .
//                            $event->getReadableTimeStart() . ' - ' . $event->getReadableTimeEnd()));
//                    }
                }

            } catch (Exception $e) {
                $errors->appendMessage(new Message($e->getMessage()));
            }
        }

        return $errors;
    }

}