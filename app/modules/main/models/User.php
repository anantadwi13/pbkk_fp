<?php

namespace Dengarin\Main\Models;

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Resultset\Simple;

/**
 * Class User
 * @property Simple|UserData    $data
 * @method  Simple|UserData     getData($parameters = null)
 * @method  integer             countData()
 */
class User extends Model
{
    const ROLE_ADMIN = 'admin';
    const ROLE_SOUND = 'sound';
    const ROLE_AMPLIFIER = 'amplifier';

    public $id;
    public $username;
    public $email;
    public $nama;
    public $password;
    public $role;
    public $status;

    public function initialize(){
        $this->setSource('users');
        $this->hasOne('id', UserData::class, 'id', [
            'reusable' => true,
            'alias' => 'data'
        ]);
    }
}