<?php
namespace Axipi\BlogBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\ParameterBag;

use Axipi\CoreBundle\Controller\AbstractController;
use Axipi\CoreBundle\Manager\CommentManager;
use Axipi\BlogBundle\Form\Type\CommentType;
use Axipi\CoreBundle\Entity\Comment;

class PostController extends AbstractController
{
    protected $commentManager;

    protected $googleRecaptchaSiteKey;

    public function __construct(
        CommentManager $commentManager,
        $googleRecaptchaSiteKey
    ) {
        $this->commentManager = $commentManager;
        $this->googleRecaptchaSiteKey = $googleRecaptchaSiteKey;
    }

    public function getPage($parameters)
    {
        $comment = new Comment();
        $comment->setItem($parameters->get('page'));
        $comment->setIsActive(true);

        $form = $this->createForm(CommentType::class, $comment, ['googleRecaptchaSiteKey' => $this->googleRecaptchaSiteKey]);
        $form->handleRequest($parameters->get('request'));

        if($form->isSubmitted()) {
            if($form->isValid()) {
                $this->commentManager->persist($form->getData());
                $this->addFlash('success', 'created');
                if(count($parameters->get('languages')) > 1) {
                    return $this->redirectToRoute('axipi_core_slug', ['slug' => $parameters->get('page')->getLanguage()->getCode().'/'.$parameters->get('page')->getSlug()]);
                } else {
                    return $this->redirectToRoute('axipi_core_slug', ['slug' => $parameters->get('page')->getSlug()]);
                }
            }
        }

        $parameters->set('form', $form->createView());

        if($parameters->get('page')->getTemplate()) {
            $template = $parameters->get('page')->getTemplate();
        } else {
            $template = $parameters->get('page')->getComponent()->getTemplate();
        }
        $response = $this->render($template, $parameters->all());
        return $response;
    }
}
