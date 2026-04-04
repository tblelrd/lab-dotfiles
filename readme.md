# Introduction

These dotfiles will work on the lab pcs and also ssh servers like klovia

## Requirements

None - everything should work out of the box.

## Installation

Clone this repo in the network home directory

```sh
cd /cs/home/$USER/ 
git clone https://github.com/tblelrd/lab-dotfiles.git dotfiles
cd dotfiles
```

Then run the setup script

```sh
./setup
```

From then on, you can just run

```sh
setup
```

On any lab pc, and it should set up the dotfiles for that pc.
