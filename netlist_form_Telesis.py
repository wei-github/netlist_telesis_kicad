from __future__ import print_function

import sys
from xml.etree import ElementTree

tree = ElementTree.parse(sys.argv[1])
root = tree.getroot()
f = open(sys.argv[2], 'w')
f_log= open(sys.argv[2]+".log", 'w') 

f.write("$PACKAGES\n")

comps=root.iter("comp")
for comp in comps:
    ref = comp.attrib["ref"]
    #print(ref)
    value = comp.find("value").text
    #print(value)
    e_footprint = comp.find("footprint")
    if e_footprint!=None:    footprint=e_footprint.text
    else:    footprint=""
    #print(footprint)
    f.write( "%s! %s! %s; %s\n"%(footprint[9:],footprint[9:],value,ref))

f.write("$NETS\n")
f_log.write("single signals:\n")

nets=root.iter("net")
for net in nets:
    name = net.attrib["name"]
    #print(name)
    
    nodes = net.findall("node")
    count=len(nodes)
    i=0
    if count>1:
        f.write("%s; "%name)
        for node in nodes:
            i=i+1
            node_ref = node.attrib["ref"]
            node_pin = node.attrib["pin"]
            #print(node_ref,".",node_pin)
            if i<count:    f.write(" %s.%s ,\n"%(node_ref,node_pin))
            else:          f.write(" %s.%s\n"%(node_ref,node_pin))
    else:
        node_ref = nodes[0].attrib["ref"]
        node_pin = nodes[0].attrib["pin"]
        f_log.write("%s: %s.%s\n"%(name,node_ref,node_pin))
f.write("$END\n")