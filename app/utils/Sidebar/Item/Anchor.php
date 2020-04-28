<?php


namespace App\Utils\Sidebar\Item;


use Phalcon\Di\Injectable;

class Anchor extends Injectable
{
    private $html = '';
    public $active = false;

    public function __construct(string $name, string $href, $icon=null)
    {
        $this->active = $this->request->getURI() == $href ? 'active' : '';

        $icon_html = !empty($icon) ? "<i class=\"$icon\"></i>" : "";
        $this->html .= "<a class='$this->active' href=\"$href\">$icon_html $name</a>";
    }

    public function generate(): string
    {
        return $this->html;
    }

    public function __toString()
    {
        return $this->generate();
    }

}