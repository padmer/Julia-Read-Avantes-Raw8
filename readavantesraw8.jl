"""
    readavantesraw8(filename,len=329)

Crummy function to read in a binary avasoft raw8 file

"""
function readavantesraw8(filename,len=329)
con=open(filename,"r")
#Skip software name
skip(con,14)
#Store DeviceID
DeviceID=""
for i in 1:9
DeviceID=string(DeviceID,read(con,Char))
end
#Skip binary that I don't know the meaning of
skip(con,305)
#Start of Xaxis Data
Xaxis=zeros(len)
for i in 1:len
    Xaxis[i]=read(con,Float32)
end
#Start of Yaxis Data
Yaxis=zeros(len)
for i in 1:len
    Yaxis[i]=read(con,Float32)
end
close(con);
    return(Xaxis,Yaxis)
end
