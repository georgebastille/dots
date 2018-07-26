#!/bin/bash
launchctl stop com.mcafee.menulet
launchctl stop com.mcafee.reporter

sudo su -

launchctl stop com.mcafee.virusscan.fmpd
launchctl stop com.mcafee.ssm.ScanManager
launchctl stop com.mcafee.virusscan.ssm.ScanFactory
launchctl stop com.mcafee.ssm.Eupdate
launchctl stop com.mcafee.agent.macompat
launchctl stop com.mcafee.agent.ma
launchctl stop com.mcafee.agent.macmn