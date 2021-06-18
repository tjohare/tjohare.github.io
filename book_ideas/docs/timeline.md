# Timeline

<!--- %%{init: { 'theme':'dark', 'sequence': {'useMaxWidth':false} } }%%   --->
<!--- %%{init: { 'theme': 'forest' } }%% --->
<!--- %%{init: { 'logLevel': 'debug', 'theme': 'neutral' } }%% --->
<!--- sample gantt found here: https://mermaid-js.github.io/mermaid/#/gantt  --->
<!--- journey style found here: https://mermaid-js.github.io/mermaid/#/user-journey --->

``` mermaid
gantt
    title Timeline
    dateFormat  YYYY-MM-DD

    section Dom Events
    Intro           :a1, 2021-12-30, 3d
    Training        :a2, 2022-01-02, 180d
    Interaction     :90d

    section World Events
    Heist 2         :2022-03-01,  2d
    Heist 3         :2022-06-01,  2d
    Heist 4         :2022-09-01,  2d

    section Micaela Events
    Meets Dom       :after a2, 7d
    Dom fixes her   :24d

    section Tethys
    Meets Dom       :after a2, 70d
    Dom fixes her   :19d

```
