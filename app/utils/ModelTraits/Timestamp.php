<?php

namespace App\Utils\ModelTraits;

trait Timestamp
{
    public $created_at;
    public $updated_at;

    public function beforeCreate(){
        $this->created_at = date('Y-m-d H:i:s');
        $this->updated_at = date('Y-m-d H:i:s');
    }

    public function beforeUpdate(){
        $this->updated_at = date('Y-m-d H:i:s');
    }
}