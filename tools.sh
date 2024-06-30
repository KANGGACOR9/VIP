#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�]�!  �_� �}���?!�����P���Ω�)�Gp�4@	�?MD�OS���Q�b?Tf��=2��jѓ �`A��2`�P"i�I�M�zQ�$## � z�E$�0��d�z�P    I4)�MO)�44  h h/=�����)v$Ї�[��J)�D�D!��F-E����fG��eY 	Z�yaK [w ���ɡ���3kV�p�#>S�}YsR��&���H�~��$��0�������L�fTU�۴x��Ҟ��'�<�ӶS�%Վ�'v/����T���k��yr�KVc�8���A�в^���~��0j�k5� `�T�X�:�ĨNp��q���j1�:�N}�ץ��J��u,)!�$e��	��j3+�@]�&Ɇ�J\��R�@x2MV��"SQ���;��wm&�Q�
6���
g�(	�؃�>���í�n�}���9%�3ιv�;�m�
^Z�]�f���]5��(/Y�$�>�&�ܯ<4{^��!�o�D�g=�!���	7�E�m��5�[u���eE<�6��m���8%"bQ��E-h:�V�,�ȑQl�|0dqQE?��~�F=Ӟy�N�������"��2}0qfWG���ϫo!nL��j,��B2K|��Ć�p(�xfof� ��y�*���8~��1;WK&�E1���e�v��|�."媗SI=$=�y�H$�n��w�Y��"J�\w�P������	���y)�i)�˥9�z������3��$g��L�^6�����PN�w
���q��<U�F�����D��_�S�h�1:�if�L`�pm�^��F�E{O��ٔ���8�J��&v
�2cą*���m1����at�r���<��6x��:Et�B�_#�Yj����f�eKHAԊ�B>���FF�SyDM�n��J����tR���2B;2ҋVI�z��r[��]Ecы�l�I_v��ȣ�s6]|2�0hb��81!dT�"8�k
���K�%L'nsdƬoY��1�"��.'���K�3!.����$��9�g62��P���R/�C#HT�#�B��e��"�o���6aDI��J FV�8�PMU�j
�8��м��4b%2fc�Rw2���ʫ\�S��";�7�Ӯồ���YV7���@�x�R�12t�〲4��^(�Y�4�
�ğ����k��\j�f�vl���C<p.\��'A�9R)y�G�D~��w$S�	Eْ