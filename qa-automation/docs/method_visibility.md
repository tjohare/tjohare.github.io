When designing automation code, you will need to consider the function's access to package.   

## Overview
A good rule of thumb is to make everything (within reason) as private as possible. This makes your class more encapsulated, and allows for changing the internals of the class without affecting the code using your class.  The following keywords available during development that you should consider are:  

### public
Any class/function may access the method/property.
```sh
@Test
	public void AuthPing() {
		//Test a ping to the API endpoint
			response =  
					RestAssured.given().
						header("Content-Type", "application/json").
					when().
						get("/api/ping").
					then().
				        log().ifError().
						statusCode(200).
						contentType("application/vnd.api+json").
					extract().response();
			response.prettyPrint();
			this.markAsPassed();
	}
```

### protected
Only this class and any subclasses may access the method/property.
```sh
protected void markAsPassed() {
		Log.info("*** TEST PASSED ***");
		System.out.println("\n\n");

	}
```

### private
Only this class may access the method/property. It won't even be inherited.


private Response getResponseInfo(String user, String pw) {

```sh
			JSONObject json = new JSONObject().
					put("identity", user).
					put("password", pw);
			temp = json.toString();
```

### final
the final keyword (lowercase) is a non-access modifier applicable only to a variable, a method or a class. Any variable, method, or class with a 'final' designation cannot be changed once it has been assigned and used only for values that are to remain constant throughout the execution of the test suite.
```sh
public final jsonOrgFileReader config = new jsonOrgFileReader(new File("config2.json"));
```
