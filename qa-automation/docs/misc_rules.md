### Conditionals and Comparisons
- Always test floating-point numbers as <= or >= relational operator, never use exact comparisons (= = or != ).
- No assumptions shall be made about the value of uninitialized variables, unless the language
definition makes a clear statement about this.
- Never use implied processing.... always state clearly a conditional’s intent

### Program Flow
- Interrupt handlers shall perform minimal processing, and shall be meticulously commented.
- In high-level languages, multiple exits from a unit are allowed if that avoids excessive control structure nesting.
- Multiple entries into a unit are not allowed.

### Variables and Values
- When data files are accessed in a tree-structured directory environment, the names of the file directories shall not be hardwired in the code; whenever possible, environment variables or some similar mechanism shall be used to provide exact directory names dynamically.
- **LET ME REPEAT:   HARDWIRING VARIABLES IS BAD**

### libraries
- Use existing libraries defined in the pom.xml file whenever possible.   If an outside library is required to be included in the test, include the pom.xml changes as a separate (but dependent) pull request from the original feature so that only feature code is necessary to be reviewed.
