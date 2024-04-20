// Execute a groovy script with no arguments
string GroovyScript(string script);

string GroovyScript(string script) {
    SetLocalString(GetModule(), "NWNX!GROOVY!" + GetStringUpperCase(script), "!");
    SetLocalString(GetModule(), "NWNX!GROOVY!RESULT", GetLocalString(GetModule(), "GROOVY!MEMORY"));
    return GetLocalString(GetModule(), "NWNX!GROOVY!RESULT");
}

// Execute a groovy script with an argument
string GroovyScript2(string script, string argument);

string GroovyScript2(string script, string argument) {
    SetLocalString(GetModule(), "NWNX!GROOVY!" + GetStringUpperCase(script), argument);
    SetLocalString(GetModule(), "NWNX!GROOVY!RESULT", GetLocalString(GetModule(), "GROOVY!MEMORY"));
    return GetLocalString(GetModule(), "NWNX!GROOVY!RESULT");
}

// Initialize the Groovy subsystem
void GroovyInit();

void GroovyInit() {
    // Placeholder for ODBC persistence
    string sMemory;
    int i;
    for (i = 0; i < 128; i++) // reserve 128*128 bytes
        sMemory += "................................................................................................................................";

    SetLocalString(GetModule(), "GROOVY!MEMORY", sMemory);

    if (GroovyScript("active") == "1") {
        WriteTimestampedLogEntry("Groovy Activated");
    } else {
        WriteTimestampedLogEntry("Groovy subsystem failed to activate");
    }
}

