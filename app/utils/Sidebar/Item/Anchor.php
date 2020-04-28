<?php


namespace App\Utils\Sidebar\Item;


use Phalcon\Di\Injectable;

class Anchor extends Injectable
{
    private $html = '';
    public $active = false;

    public function __construct(string $name, string $href, $icon=null)
    {
        $href_uri = $this->di->get('urlToUri', [$href]);
        $this->active = $this->request->getURI() == $href_uri ? 'active' : '';

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