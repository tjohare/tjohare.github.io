# Welcome to MkDocs

For full documentation visit [mkdocs.org](https://mkdocs.org).

## Commands

* `:::js mkdocs new [dir-name]` - Create a new project.
* `:::js mkdocs serve` - Start the live-reloading docs server.
* `:::js mkdocs build` - Build the documentation site.
* `:::js mkdocs help` - Print this help message.

## Project layout
    :::python
    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.

another example

    :::js
    another code block
    test this with css
    Erik.Ruiz

```java hl_lines="5 7"
import java.net.URI;
import org.json.JSONObject;
import org.json.JSONTokener;

public class GetChefPwd {

    public static String getStagingPwd(String chefUrl) throws Exception {
        URI uri = new URI(chefUrl);
        JSONTokener tokener = new JSONTokener(uri.toURL().openStream());
        JSONObject root = new JSONObject(tokener);
        String pwd = root.getString("password");

        return pwd;
    }
}
```

## Styling

Styling information can be found here:

??? warning "Spoiler Links"
    https://squidfunk.github.io/mkdocs-material/extensions/admonition/

    https://squidfunk.github.io/mkdocs-material/getting-started/

!!! warning "Warning text"
    this isn't fully understood by me yet....


here's my checklist

* [x] I'm awesome
* [x] I get shit done
* [ ] I'm a push-over

Another good link is: http://pygments.org/
