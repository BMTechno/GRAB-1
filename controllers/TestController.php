<?php

namespace app\controllers;

use yii\web\Controller;
use app\models\Test;

class TestController extends Controller
{
    public function actionIndex()
    {
        $query = Test::find()->all();

        return $this->render('index', [
            'query' => $query,
        ]);
    }
}