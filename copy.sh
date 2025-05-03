#!/bin/bash

mkdir -p $HOME/.config/hypr/scripts/
cp randy-widget.sh $HOME/.config/hypr/scripts/
echo copied randy-widget.sh to $HOME/.config/hypr/scripts/
mkdir -p $HOME/.config/hypr/configs/
cp randy-wrules.conf $HOME/.config/hypr/configs/
echo copied randy-wrules.conf to $HOME/.config/hypr/configs/
cp .randy.yml $HOME/
echo copied .randy.yml to $HOME/

echo Done
