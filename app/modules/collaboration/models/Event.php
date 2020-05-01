<?php

namespace Dengarin\Collaboration\Models;

use App\Utils\ModelTraits\StatusTrait;
use App\Utils\ModelTraits\Timestamp;
use DateTime;
use Dengarin\Main\Models\User;
use Exception;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Resultset\Simple;

/**
 * Class Schedule
 * @package Dengarin\Collaboration\Models
 * @property Simple|User $sound
 * @method  Simple|User     getSound($parameters = null)
 * @method  integer         countSound()
 * @property Simple|User $amplifier
 * @method  Simple|User     getAmplifier($parameters = null)
 * @method  integer         countAplifier()
 */
class Event extends Model
{
    use Timestamp, StatusTrait;

    const STATUS_DELETED = 1;
    const STATUS_READ = 2;
    const STATUS_FOLLOWED_UP = 4;
    const STATUS_ACCEPTED = 8;      // status == rejected if the event has been followed up


    public $id;
    public $sound_user_id;
    public $amplifier_user_id;
    public $name;
    public $description;
    public $time_start;
    public $time_end;
    public $location;
    private $status;

    public function initialize()
    {
        $this->setSource('events');

        $this->belongsTo('sound_user_id', User::class, 'id', [
            'reusable' => true,
            'alias' => 'sound'
        ]);

        $this->belongsTo('amplifier_user_id', User::class, 'id', [
            'reusable' => true,
            'alias' => 'amplifier'
        ]);
    }

    public function getReadableTimeStart()
    {
        try {
            $date = new DateTime($this->time_start);
            return $date->format('D, d M Y H:i');
        } catch (Exception $e) {
            return null;
        }
    }

    public function getReadableTimeEnd()
    {
        try {
            $date = new DateTime($this->time_end);
            return $date->format('D, d M Y H:i');
        } catch (Exception $e) {
            return null;
        }
    }

    public function __get(string $property)
    {
        try {
            $dateTimeStart = new DateTime($this->time_start);
            $dateTimeEnd = new DateTime($this->time_end);
            switch ($property) {
                case 'start_date':
                    return $dateTimeStart->format('Y-m-d');
                case 'start_time':
                    return $dateTimeStart->format('H:i');
                case 'end_date':
                    return $dateTimeEnd->format('Y-m-d');
                case 'end_time':
                    return $dateTimeEnd->format('H:i');
            }
        } catch (Exception $e){
            return null;
        }

        return parent::__get($property);
    }
}