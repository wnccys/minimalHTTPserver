require 'socket'

server = TCPServer.new('localhost', 3000)

loop do 
    socket = server.accept

    request = socket.gets 

    STDERR.puts request

    response = 'Hello!!1'

    socket.print <<-eoc
        HTTP/1.1 200 OK\r\n 
        Content-Type: text/plain\r\n 
        Content-Length: #{response.bytesize}\r\n
        Connection: close\r\n
    eoc

    socket.print "\r\n"

    socket.print response 

    socket.close
end