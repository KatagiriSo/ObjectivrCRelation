#require './filelist'


def getFileList(dir)
    filelist = Dir.glob dir + "**/*"
    #filelist = Dir::entries(dir)
    #p filelist
    ret = []
    filelist.each{|f|

      if f == "."
        next
      end
      if f == ".."
        next
      end

      #p File.extname(f)
      if File.extname(f) == ".h"
        ret.push(f)
        next
    elsif File.extname(f) == ".m"
        ret.push(f)
       next
     end
    }
    return ret
end




#p filelist

def getFileString(file)
    if File::ftype(file) == "directory"
        return ""
    end

    f = File.open(file)
    r = f.read
    f.close
    return r
end

#p getFileString("filelist.rb")

#a = getFileString( basePath+"MSPLApi.h")

def omitExt(file)
    b = File.basename(file,".h")
    filename = File.basename(b, ".m")
    return filename
end


def getImport(text)
    ret = []
    text.each_line{|line|
        line.chomp!
        if /import.*<(.*)>/ =~ line
            #p line

            c = omitExt($1)
            #ret.push(c)
        end
        if /import.*"(.*)"/ =~line

            #p line
            c = omitExt($1)

            ret.push(c)

        end
    }
    return ret
end

basePath = "./"
if ARGV[0] != nil
  basePath = ARGV[0]
end
filelist = getFileList(basePath)


print("digraph sample {\n")
#print(" graph[concentrate=true];\n")

hash = {}

filelist.each{|file|

    filename = omitExt(file)

    r = getImport(getFileString(basePath + file))

# mにかかれているhを削除。

    index = r.index(filename)
    if index != nil
        r.delete_at(index)
    end

    hash[filename] = r




}


filelist.each{|file|

    filename = omitExt(file)

        hash[filename].each{|file2|

        print("\""+filename +"\""+ "->" +  "\""+file2 +"\""+";\n")
    }
}

print("}\n")

# dot -Tgif sample1.dot -o sample1.gif
