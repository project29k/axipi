<?php
namespace Axipi\BlogBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\ParameterBag;

use Axipi\CoreBundle\Controller\AbstractController;

class BlogController extends AbstractController
{
    public function getPage($parameters)
    {
        $parameters->set('children', $this->get('axipi_core_manager_item')->getList(['component_service' => 'axipi_blog_controller_post', 'active' => true]));

        if($parameters->get('page')->getTemplate()) {
            $template = $parameters->get('page')->getTemplate();
        } else {
            $template = $parameters->get('page')->getComponent()->getTemplate();
        }
        $response = $this->render($template, $parameters->all());
        return $response;
    }
}
