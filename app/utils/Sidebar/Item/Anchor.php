<?php


namespace App\Utils\Sidebar\Item;


class Anchor
{
    private $html = '';

    public function __construct(string $name, string $href, $icon=null)
    {
        $icon_html = !empty($icon) ? "<i class=\"$icon\"></i>" : "";
        $this->html .= "<a href=\"$href\">$icon_html $name</a>";
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