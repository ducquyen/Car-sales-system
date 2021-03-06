<?php

/*
 * Process.php http://php.net/manual/ru/function.exec.php#88704
 * An easy way to keep in track of external processes.
 * Ever wanted to execute a process in php, but you still wanted to have somewhat controll of the process ? Well.. This is a way of doing it.
 * @compability: Linux only. (Windows does not work).
 * @author: Peec
 */

class Process {
  private $pid;
  private $command;

  public function __construct($cl = FALSE) {
    if ($cl != FALSE) {
      $this->command = $cl;
      $this->runCom();
    }
  }

  private function runCom() {
    $command = 'nohup ' . $this->command . ' > /dev/null 2>&1 & echo $!';
    exec($command, $op);
    $this->pid = (int) $op[0];
  }

  public function getPid() {
    return $this->pid;
  }

  public function setPid($pid) {
    $this->pid = $pid;
  }

  public function start() {
    if ($this->command != '') {
      $this->runCom();
    }
    else {
      return TRUE;
    }
  }

  public function stop() {
    $command = 'kill ' . $this->pid;
    exec($command);
    if ($this->status() == FALSE) {
      return TRUE;
    }
    else {
      return FALSE;
    }
  }

  public function status() {
    $command = 'ps -p ' . $this->pid;
    exec($command, $op);
    if (!isset($op[1])) {
      return FALSE;
    }
    else {
      return TRUE;
    }
  }
}

?>