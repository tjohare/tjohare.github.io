# How do we handle Release Tickets, Builds, Branches, Tags, and Jira

## Release Tickets

## Builds

## Branching
* You branch off of the 'Master' branch, treating everything essentially as a hotfix branch
* Developers are responsible for merging the code from master into their feature Branches


## Tags
* master branch is only tagged when the build is deployed/ready to deploy to production/released


## Jira







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

??? link "Spoiler Links"
    https://squidfunk.github.io/mkdocs-material/extensions/admonition/

    https://squidfunk.github.io/mkdocs-material/getting-started/

!!! warning "Warning text"
    this isn't fully understood by me yet....


here's my checklist

* [x] I'm awesome
* [ ] I'm a push-over

Another good link is: http://pygments.org/
