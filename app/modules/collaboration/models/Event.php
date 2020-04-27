<?php

namespace Dengarin\Collaboration\Models;

use App\Utils\ModelTraits\Timestamp;
use Dengarin\Main\Models\User;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Resultset\Simple;

/**
 * Class Schedule
 * @package Dengarin\Collaboration\Models
 * @property Simple|User    $sound
 * @method  Simple|User     getSound($parameters = null)
 * @method  integer         countSound()
 * @property Simple|User    $amplifier
 * @method  Simple|User     getAmplifier($parameters = null)
 * @method  integer         countAplifier()
 */
class Event extends Model
{
    use Timestamp;

    public $id;
    public $sound_user_id;
    public $amplifier_user_id;
    public $name;
    public $description;
    public $time_start;
    public $time_end;
    public $location;
    private $status;

    public function initialize(){
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
}