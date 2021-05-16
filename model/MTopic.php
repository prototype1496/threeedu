<?php


class MTopic {

    private $topicId;
    private $topicName;
    private $topicDescription;
    private $subjectId;
    
    function getTopicId() {
        return $this->topicId;
    }

    function getTopicName() {
        return $this->topicName;
    }

    function getTopicDescription() {
        return $this->topicDescription;
    }

    function setTopicId($topicId) {
        $this->topicId = $topicId;
    }

    function setTopicName($topicName) {
        $this->topicName = $topicName;
    }

    function setTopicDescription($topicDescription) {
        $this->topicDescription = $topicDescription;
    }
    
    function getSubjectId() {
        return $this->subjectId;
    }

    function setSubjectId($subjectId) {
        $this->subjectId = $subjectId;
    }



    
}
