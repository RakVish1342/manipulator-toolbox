function R = create_robot(links)
    link_name = inputname(1);
    eval(strcat(link_name ,"= links;"))
    link_str = "";
    for i=1:length(links)
        link_str = strcat(link_str ," ",link_name,"{",num2str(i),"}");
    end
    eval(strcat('R = SerialLink([',link_str,']);'));
end