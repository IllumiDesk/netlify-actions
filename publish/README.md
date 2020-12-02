# GitHub action to publish a deploy on Netlify

Publish a deploy on Netlify and lock deploy (stop auto publish)

## Secrets
- `NETLIFY_ACCESS_TOKEN` - *Required* Netlify token for API calls
- `NETLIFY_SITE_ID` - API site ID of the site you wanna work on
  [Obtain it from the UI](https://www.netlify.com/docs/cli/#link-with-an-environment-variable)

## Example

Publish the latest draft in Netlify

```yml
on: push
name: Publish on Netlify

jobs:
  publish:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@master

    - name: Publish
      uses: netlify/actions/publish@master
      env:
        NETLIFY_ACCESS_TOKEN: ${{ secrets.NETLIFY_ACCESS_TOKEN }}
        NETLIFY_SITE_ID: ${{ secrets.NETLIFY_SITE_ID }}
```
