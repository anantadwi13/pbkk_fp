<?php

namespace Dengarin\Main\Models;

use Phalcon\Mvc\Model;

class UserData extends Model
{
    public $id;
    public $bio;

    public function initialize(){
        $this->setSource('userdatas');
        $this->belongsTo('id', User::class, 'id');
    }
}