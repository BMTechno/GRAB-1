<?php

namespace app\modules\dummy\controllers;

use yii\web\Controller;
use app\models\Test;

class TestController extends Controller
{
	public function actionIndex()
    {
        $query = Test::find()->all();
        
        $new = new Test;
        $new->id = 'T0003';
        $new->name = 'TEST3';
        
        array_push($query,$new);

        return $this->render('index', [
            'query' => $query,
        ]);
    }
}