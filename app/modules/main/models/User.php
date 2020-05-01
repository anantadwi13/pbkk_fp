<?php

namespace Dengarin\Main\Models;

use Dengarin\Challenge\Models\Submission;
use App\Utils\ModelTraits\StatusTrait;
use App\Utils\ModelTraits\Timestamp;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Resultset\Simple;

/**
 * Class User
 * @property Simple|UserData $data
 * @method  Simple|UserData     getData($parameters = null)
 * @method  integer             countData()
 * @property Simple|Friend    $friends_following
 * @property Simple|Friend    $friends_followers
 * @property Simple|User    $following
 * @property Simple|User    $followers
 */
class User extends Model
{
    use Timestamp, StatusTrait;

    const ROLE_ADMIN = 'admin';
    const ROLE_SOUND = 'sound';
    const ROLE_AMPLIFIER = 'amplifier';
    const ROLE_GUEST = 'guest';

    const STATUS_DISABLED = 1;
    const STATUS_EMAIL_VERIFIED = 2;
    const STATUS_VERIFIED_ACCOUNT = 4;

    public $id;
    public $username;
    public $email;
    public $name;
    public $password;
    public $role;

    public function initialize()
    {
        $this->setSource('users');
        $this->hasOne('id', UserData::class, 'id', [
            'reusable' => true,
            'alias' => 'data'
        ]);
        $this->hasMany(
            'id',
            Submission::class,
            'id'
        );

        $this->hasMany('id', Friend::class, 'following_user_id', [
            'reusable' => true,
            'alias' => 'friends_followers'
        ]);

        $this->hasMany('id', Friend::class, 'user_id', [
            'reusable' => true,
            'alias' => 'friends_following'
        ]);

        $this->hasManyToMany(
            'id',
            Friend::class,
            'following_user_id',
            'user_id',
            User::class,
            'id',
            [
                'reusable' => true,
                'alias' => 'followers',
                'params' => [
                    'conditions' => sprintf('[%s].status & ?0 = ?1 and [%s].status & ?2 = ?3', Friend::class, Friend::class),
                    'bind' => [
                        0 => Friend::STATUS_ACCEPTED,
                        1 => Friend::STATUS_ACCEPTED,
                        2 => Friend::STATUS_TAKE_ACTION,
                        3 => Friend::STATUS_TAKE_ACTION,
                    ]
                ]
            ]
        );
        $this->hasManyToMany(
            'id',
            Friend::class,
            'user_id',
            'following_user_id',
            User::class,
            'id',
            [
                'reusable' => true,
                'alias' => 'following',
                'params' => [
                    'conditions' => '[Dengarin\Main\Models\Friend].status & ?0 = ?1 and [Dengarin\Main\Models\Friend].status & ?2 = ?3',
                    'bind' => [
                        0 => Friend::STATUS_ACCEPTED,
                        1 => Friend::STATUS_ACCEPTED,
                        2 => Friend::STATUS_TAKE_ACTION,
                        3 => Friend::STATUS_TAKE_ACTION,
                    ]
                ]
            ]
        );
    }
}