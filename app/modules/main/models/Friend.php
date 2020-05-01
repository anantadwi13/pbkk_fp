<?php

namespace Dengarin\Main\Models;

use App\Utils\ModelTraits\StatusTrait;
use App\Utils\ModelTraits\Timestamp;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Resultset\Simple;

class Friend extends Model
{
    use Timestamp, StatusTrait;

    const STATUS_BLOCKED = 1;
    const STATUS_TAKE_ACTION = 2;
    const STATUS_ACCEPTED = 4;

    public $user_id;
    public $following_user_id;

    public function initialize()
    {
        $this->setSource('friends');
        $this->belongsTo('user_id', User::class, 'id', [
            'reusable' => true,
            'alias' => 'from'
        ]);
        $this->belongsTo('following_user_id', User::class, 'id', [
            'reusable' => true,
            'alias' => 'following'
        ]);
    }
}