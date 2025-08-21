##Inverted Pendulum
Hệ thống con lắc ngược là một ví dụ tiêu biểu về các hệ thống bất ổn định, phi tuyến và thách thức lớn trong lĩnh vực điều khiển tự động. Mục tiêu của bài toán này là duy trì con lắc ở trạng thái cân bằng thẳng đứng thông qua việc điều khiển chuyển động của xe đẩy.

<img width="397" height="424" alt="image" src="https://github.com/user-attachments/assets/329ed39c-dd5a-416d-a3da-cf0a46449419" />

## THIẾT KẾ BỘ ĐIỀU KHIỂN LQR
<img width="580" height="303" alt="image" src="https://github.com/user-attachments/assets/5e3d588d-c7be-4e67-a350-03a98d592e1e" />

<img width="680" height="277" alt="image" src="https://github.com/user-attachments/assets/78b7e1b9-a165-4642-be30-dcbdcd0ae8ca" />

<img width="680" height="245" alt="image" src="https://github.com/user-attachments/assets/cc37af8f-290b-4412-a595-e9ac3320d6d6" />

## Đáp ứng lực điều khiển u theo thời gian cho vòng kín LQR
<img width="602" height="426" alt="image" src="https://github.com/user-attachments/assets/1da5ab6e-a862-498a-89e2-7ab5b53754ef" />

## Đáp ứng góc θ (màu xanh) và vận tốc góc θ ̇ (màu đỏ) theo thời gian cho vòng kín LQR
<img width="602" height="426" alt="image" src="https://github.com/user-attachments/assets/aa49601d-aa05-4604-85f9-4a46dbfa19d6" />

## Đáp ứng vị trí xe x(màu đỏ) và vận tốc vị trí x ̇(màu tím) theo thời gian cho vòng kín LQR
<img width="601" height="425" alt="image" src="https://github.com/user-attachments/assets/af7cd4d7-4389-4611-b7d0-bd1c2d0ba585" />

## THIẾT KẾ BỘ LỌC KALMAN
Trong quá trình thiết kế bộ điều khiển ở trên (ví dụ: LQR), ta đã giả định rằng toàn bộ trạng thái của hệ thống đều có thể đo lường chính xác. Tuy nhiên, trong thực tế, giả định này không hoàn toàn đúng do sự tồn tại của nhiễu hệ thống và nhiễu đo lường. Các nhiễu này phát sinh từ các yếu tố như nhiễu bên ngoài, sai số cảm biến, lượng tử hóa tín hiệu và điều kiện môi trường.
<img width="532" height="283" alt="image" src="https://github.com/user-attachments/assets/f90d092b-7e9a-4937-bf4b-f5f0c194350a" />

## THIẾT KẾ BỘ ĐIỀU KHIỂN LQG

<img width="680" height="486" alt="image" src="https://github.com/user-attachments/assets/b71cdc03-5d6e-4bd6-a996-8fcc92b1910a" />
## Đáp ứng lực điều khiển u(t) trong vòng kín LQG khi thêm nhiễu đo

<img width="616" height="344" alt="image" src="https://github.com/user-attachments/assets/b66d6b9d-01b0-4d2b-bd99-8236b201da51" />

## Đáp ứng góc θ (màu xanh) và vận tốc góc θ ̇ (màu đỏ) theo thời gian cho vòng kín LQG với nhiễu đo
<img width="605" height="381" alt="image" src="https://github.com/user-attachments/assets/f0cb33b8-a564-41aa-9b39-cd17f87739d3" />

## Đáp ứng vị trí xe x(màu đỏ) và vận tốc vị trí x ̇(màu tím) theo thời gian cho vòng kín LQG với nhiễu đo
<img width="628" height="392" alt="image" src="https://github.com/user-attachments/assets/1d69a1c2-100b-4f00-bc97-3b3f864bf81a" />
