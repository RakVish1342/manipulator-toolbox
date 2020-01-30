function jvec = get_jcol(i,j,z,p,a,jt,ot)
%    nlinks = size(z,2);
   jvec = sym(zeros(6,1));
   if ot == "l"
       k = a(:,j+1);
   elseif ot == "m"
       k = p(:,j);
   end
   
   if jt == 'r'
       jvec(1:3) = cross(z(:,i), k-p(:,i));
       jvec(4:6) = z(:,i);
   elseif  jt == 'p'
       jvec(1:3) = z(:,i);
       jvec(4:6) = [0 0 0];
   end
end