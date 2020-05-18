<?php

namespace App\Utils\ModelTraits;

use DateTime;
use Exception;

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

    public function getReadableCreatedAt()
    {
        try {
            $date = new DateTime($this->created_at);
            return $date->format('D, d M Y H:i:s');
        } catch (Exception $e) {
            return null;
        }
    }

    public function getReadableUpdatedAt()
    {
        try {
            $date = new DateTime($this->updated_at);
            return $date->format('D, d M Y H:i:s');
        } catch (Exception $e) {
            return null;
        }
    }
}