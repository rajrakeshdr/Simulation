$pipename="msagent_test"
$pipe = New-Object System.IO.Pipes.NamedPipeServerStream($pipename,"InOut",
10, "Byte", "None", 1024, 1024, $PipeSecurity)
$PipeHandle = $pipe.SafePipeHandle.DangerousGetHandle()