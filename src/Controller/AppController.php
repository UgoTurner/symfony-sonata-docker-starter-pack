<?php

namespace App\Controller;

use App\Entity\Post;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

final class AppController extends Controller
{
    /**
     * @Route("/", name="home")
     */
    public function homeAction() : Response
    {
        $posts = $this->getDoctrine()
            ->getManager()
            ->getRepository(Post::class)
            ->findAll();
        return $this->render('home/home.html.twig', ['posts' => $posts]);
    }
}