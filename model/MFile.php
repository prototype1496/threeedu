<?php

class MFile {

    private $fileId;
    private $fileName;    
    private $topicId;
    private $classId;
    
    function getFileId() {
        return $this->fileId;
    }

    function getFileName() {
        return $this->fileName;
    }

    function getTopicId() {
        return $this->topicId;
    }
  
    function setFileId($fileId) {
        $this->fileId = $fileId;
    }

    function setFileName($fileName) {
        $this->fileName = $fileName;
    }

    function setTopicId($topicId) {
        $this->topicId = $topicId;
    }
    
    function getClassId() {
        return $this->classId;
    }

    function setClassId($classId) {
        $this->classId = $classId;
    }


}
