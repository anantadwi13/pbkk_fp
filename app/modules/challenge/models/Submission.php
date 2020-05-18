<?php

namespace Dengarin\Challenge\Models;

use Dengarin\Main\Models\User;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Resultset\Simple;
// use Phalcon\Validation;
// use Phalcon\Validation\Validator\Confirmation;

/**
 * Class Competition
 * @property Simple|UserData $data
 * @method  Simple|UserData     getData($parameters = null)
 * @method  integer             countData()
 */
class Submission extends Model
{
    public $idsubm;
    public $files;
    public $idcomp;
    public $id;
    
    public function initialize()
    {
        $this->setSource('submission');
        $this->belongsTo(
            'idcomp',
            Competition::class,
            'idcomp'
        );
        $this->belongsTo(
            'id',
            User::class,
            'id'
        );
    }

}