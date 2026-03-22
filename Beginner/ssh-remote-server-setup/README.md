# SSH Remote Server Setup

Setting up a remote Linux server on AWS EC2 and configuring SSH access with two key pairs.

## Steps

### 1. Create EC2 Instance

- Launch an EC2 instance on AWS
- Create first key pair (`key1`) during setup, select **ED25519**, download the `.pem` file

### 2. Generate Second SSH Key

```bash
ssh-keygen -t ed25519 -C "key2" -f ~/.ssh/key2
```

### 3. Move First Key and Set Permissions

```bash
mv ~/Downloads/key1.pem ~/.ssh/key1.pem
chmod 400 ~/.ssh/key1.pem
```

### 4. Connect with First Key

```bash
ssh -i ~/.ssh/key1.pem ec2-user@<server-ip>
```

### 5. Add Second Key to Server

On the server, append the second public key to authorized_keys:

```bash
echo "<key2.pub content>" >> ~/.ssh/authorized_keys
```

### 6. Connect with Second Key

```bash
ssh -i ~/.ssh/key2 ec2-user@<server-ip>
```

### 7. Configure SSH Aliases

```bash
nano ~/.ssh/config
```

See `config.example` for the configuration template.

Now connect using aliases:

```bash
ssh aws-key1
ssh aws-key2
```

## Project

https://roadmap.sh/projects/ssh-remote-server-setup