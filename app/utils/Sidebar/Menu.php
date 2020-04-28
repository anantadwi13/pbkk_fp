<?php

namespace App\Utils\Sidebar;

use App\Utils\Sidebar\Item\Anchor;
use App\Utils\Sidebar\Item\SubMenu;

class Menu
{

    private $html = '';

    public function __construct()
    {
        $this->html .= '<ul class="nav-main">';
    }

    /**
     * @param Anchor|SubMenu|string $item
     * @param bool $open
     * @return Menu
     */
    public function addItem($item, $open=false): Menu
    {
        if ($open || (isset($item->active) && $item->active)) $open = true;
        $opened = $open ? 'class="open"' : '';
        $this->html .= "<li $opened>";
        if ($item instanceof Anchor) {
            $this->html .= $item->generate();
        }
        elseif ($item instanceof SubMenu) {
            $this->html .= $item->generate();
        }
        elseif (is_string($item)) {
            $this->html .= $item;
        }
        $this->html .= "</li>";
        return $this;
    }

    public function addHeading(string $name, string $alias): Menu
    {
        $this->html .= "<li class=\"nav-main-heading\"><span class=\"sidebar-mini-visible\">$alias</span><span class=\"sidebar-mini-hidden\">$name</span></li>";
        return $this;
    }

    public function generate(): string
    {
        return $this->html . "</ul>";
    }

    public function __toString()
    {
        return $this->generate();
    }

}