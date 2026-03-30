# discourse-osu-auth

A Discourse plugin that enables login via [osu!](https://osu.ppy.sh) OAuth2.

## Features

- Sign in with osu! button on the login page
- Connect/disconnect osu! account via Preferences → Account (Associated Accounts)
- osu! brand pink button with white icon

## Installation

Add the following to your Discourse `app.yml` under `hooks.after_code`:

```yaml
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - git clone https://github.com/PhoenixEmik/discourse-osu-auth.git
```

Then rebuild your container:

```bash
./launcher rebuild app
```

## Configuration

1. Register an OAuth application at https://osu.ppy.sh/home/account/edit (OAuth section)
2. Set the callback URL to `https://your-discourse.com/auth/osu/callback`
3. In Discourse Admin → Settings → Login:
   - Enable **Login with osu!**
   - Enter your **osu! auth client ID**
   - Enter your **osu! auth client secret**

## License

[MIT](LICENSE)
