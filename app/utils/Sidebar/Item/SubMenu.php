<?php


namespace App\Utils\Sidebar\Item;


class SubMenu
{
    private $html = '';
    public $active = false;

    /**
     * SubMenu constructor.
     * @param string $name
     * @param string|null $icon
     */
    public function __construct(string $name, $icon=null)
    {
        $this->html .= '<a class="nav-submenu" data-toggle="nav-submenu" href="#">';
        if ($icon != null) $this->html .= "<i class=\"$icon\"></i>";
        $this->html .= "<span class=\"sidebar-mini-hide\">$name</span></a>";

        $this->html .= '<ul>';
    }

    /**
     * @param Anchor|SubMenu|string $item
     * @param bool $open
     * @return SubMenu
     */
    public function addItem($item, $open=false): SubMenu
    {
        if ($open || (isset($item->active) && $item->active)) $this->active = true;
        $opened = $this->active ? 'class="open"' : '';
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

    public function generate(): string
    {
        return $this->html . '</ul>';
    }

    public function __toString()
    {
        return $this->generate();
    }

}