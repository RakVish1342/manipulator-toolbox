function [s, num_links, joint_type, ax_rot, link_ax, link_len] = rak_mit_dhfactor_string(num_links)

    disp('Collecting Robot Link Parameters...');
    disp('NOTE: All rotations and translations to be provided according to global xyz frame.');
%     prompt1 = 'How many links are there in the robot manipulator? ';
%     num_links = input(prompt1);

    for i=1:num_links
        flag = 1;
        flag2 = 1;
        prompt2 = strcat('What kind of joint is joint  ', num2str(i), '? (p for prismatic, r for revolute): ');            %%The link number should show here
        joint_type(i) = input(prompt2,'s');
        
        switch joint_type(i)
            
            case 'p'
                while flag~=0
                    prompt5 = ('Along which axis does this prismatic link translate? (x, y or z): ');
                    ax_rot(i) = input(prompt5,'s');
                    if ((ax_rot(i)=='x')||(ax_rot(i)=='y')||(ax_rot(i)=='z')||(ax_rot(i)=='X')||(ax_rot(i)=='Y')||(ax_rot(i)=='Z'))
                        flag=0;
                    else
                        disp('Please enter valid axis - x,y,z or X,Y,Z');
                        flag=1;
                    end
                end
                while flag2~=0
                    prompt4 = ('Along which axis does the link connected to this prismatic joint extend? (x, y or z): ');
                    link_ax(i) = input(prompt4,'s');
                    if ((link_ax(i)=='x')||(link_ax(i)=='y')||(link_ax(i)=='z')||(link_ax(i)=='X')||(link_ax(i)=='Y')||(link_ax(i)=='Z'))
                        flag2=0;
                    else
                        disp('Please enter valid axis - x,y,z or X,Y,Z');
                        flag2=1;
                    end
                end              
                prompt3 = 'How far does the this prismatic joint translate?: ';
                link_len(i) = input(prompt3);

            case 'r'
                while flag2~=0
                    prompt4 = ('About what axis does this revolute joint rotate? (x, y or z): ');
                    ax_rot(i) = input(prompt4,'s');
                    if ((ax_rot(i)=='x')||(ax_rot(i)=='y')||(ax_rot(i)=='z')||(ax_rot(i)=='X')||(ax_rot(i)=='Y')||(ax_rot(i)=='Z'))
                        flag2=0;
                    else
                        disp('Please enter valid axis - x,y,z or X,Y,Z');
                        flag2=1;
                    end
                end
                
                while flag~=0
                    prompt5 = 'Along which axis does the link connected to the revolute joint extend? (x, y or z): ';
                    link_ax(i) = input(prompt5,'s');
                    if ((link_ax(i)=='x')||(link_ax(i)=='y')||(link_ax(i)=='z')||(link_ax(i)=='X')||(link_ax(i)=='Y')||(link_ax(i)=='Z'))
                        flag=0;
                    else
                        disp('Please enter valid axis - x,y,z or X,Y,Z: ');
                        flag=1;
                    end
                end
                prompt3 = ('How far does the link from this revolute joint go?: ');
                link_len(i) = input(prompt3);
                
        end
    end

    
    
    s = '';
    for k=1:num_links
        if joint_type(k)=='r'
            s=strcat(s,'R',lower(ax_rot(k)),'(q',num2str(k),')'); 
        end
        if joint_type(k)=='p'
            s=strcat(s,'R',lower(ax_rot(k)),'(q',num2str(k),')');
        end
        % Keep if condition to assume the end effector is at the last joint
        %if(k~=num_links)
            s=strcat(s,'.');
            if (link_len(k)==0)
                s=strcat(s,'T',lower(link_ax(k)),'(0)');
            else
                s=strcat(s,'T',lower(link_ax(k)),'(L',num2str(k),')');
            end
        if(k~=num_links)            
            s=strcat(s,'.');
        end
    end
    display(s)
    
    save('dh_tmp.mat')
end
