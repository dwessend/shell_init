sudo yum update -y

sudo passwd ec2-user

# Installing ZSH
sudo yum -y install zsh

# Check ZSH has been installed
zsh --version
# Install "util-linux-user" because "chsh" is not available by default
# See https://superuser.com/a/1389273/599050
sudo yum install util-linux-user

# Change default shell for current user, most of the times it would be "ec2-user"
# Or use "sudo chsh -s $(which zsh) $(whoami)" to be sure
chsh -s "$(which zsh)"

# Install oh-my-zsh from https://github.com/ohmyzsh/ohmyzsh#basic-installation

# OPTIONAL

# I recommend you to install the following plugins which make your life easier and more colorful

# Assuming you have git installed
# If not, simply do "sudo yum install git -y"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
copy ./p10k.zsh ~/.p10k.zsh
source  ~/.zshrc
pip3 install --user --upgrade boto3
export instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
python ./resize.py
