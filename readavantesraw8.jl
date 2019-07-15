"""
    readavantesraw8(filename,len=329)

Crummy function to read in a binary avasoft raw8 file

"""
function readavantesraw8(filename,len=329)
con=open(filename,"r")
    mark(con)
skip(con,14)
DeviceID=""
for i in 1:9
DeviceID=string(DeviceID,read(con,Char))
end
skip(con,305)
Xaxis=zeros(len)
for i in 1:len
    Xaxis[i]=read(con,Float32)
end
Yaxis=zeros(len)
for i in 1:len
    Yaxis[i]=read(con,Float32)
end
close(con);
    return(Xaxis,Yaxis)
end
