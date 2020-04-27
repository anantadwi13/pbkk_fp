<?php

namespace Dengarin\Main\Models;

use App\Utils\ModelTraits\Timestamp;
use Phalcon\Mvc\Model;

class UserData extends Model
{
    use Timestamp;

    public $id;
    public $bio;

    public function initialize(){
        $this->setSource('userdatas');
        $this->belongsTo('id', User::class, 'id');
    }
}