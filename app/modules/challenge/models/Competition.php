<?php

namespace Dengarin\Challenge\Models;

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
class Competition extends Model
{
    public $idcomp;
    public $title;
    public $description;
    public $duedate;
    public $image;    

    public function initialize()
    {
        $this->setSource('competition');
        $this->hasMany(
            'idcomp',
            Submission::class,
            'idcomp'
        );
    }

}