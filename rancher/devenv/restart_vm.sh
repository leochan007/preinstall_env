#!/bin/bash

vagrant destroy

rm -rf .vagrant

BOX_NAME=rancher_base
BOX_TAG=alphacar/$BOX_NAME

vagrant up base

rm -rf $BOX_NAME.box

vagrant package --base base --output $BOX_NAME.box

vagrant box remove $BOX_TAG

vagrant box add --name $BOX_TAG $BOX_NAME.box

vagrant up master worker
