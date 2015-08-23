<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "mst_project".
 *
 * @property integer $project_id
 * @property string $project_name
 * @property string $descrip
 *
 * @property MstProjectuser[] $mstProjectusers
 * @property TRab[] $tRabs
 */
class Project extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'mst_project';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['project_name'], 'required'],
            [['project_name', 'descrip'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'project_id' => 'Project ID',
            'project_name' => 'Project Name',
            'descrip' => 'Descrip',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMstProjectusers()
    {
        return $this->hasMany(MstProjectuser::className(), ['project_id' => 'project_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTRabs()
    {
        return $this->hasMany(TRab::className(), ['project_id' => 'project_id']);
    }
}
