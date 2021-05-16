<?php

class MConversation {
    
    private $converstationId;
    private $conversationMessage;
    private $conversationType;
    private $initiatorId;
    private $receiverId;
    
    function getConverstationId() {
        return $this->converstationId;
    }

    function getConversationMessage() {
        return $this->conversationMessage;
    }

    function getConversationType() {
        return $this->conversationType;
    }

    function getInitiatorId() {
        return $this->initiatorId;
    }

    function getReceiverId() {
        return $this->receiverId;
    }

    function setConverstationId($converstationId) {
        $this->converstationId = $converstationId;
    }

    function setConversationMessage($conversationMessage) {
        $this->conversationMessage = $conversationMessage;
    }

    function setConversationType($conversationType) {
        $this->conversationType = $conversationType;
    }

    function setInitiatorId($initiatorId) {
        $this->initiatorId = $initiatorId;
    }

    function setReceiverId($receiverId) {
        $this->receiverId = $receiverId;
    }

}
