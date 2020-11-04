`timescale  1ns/1ns                // �������ʱ�䵥λ1ns�ͷ���ʱ�侫��Ϊ1ns

module  flow_led_tb;               // ����ģ��

    //parameter  define
parameter  T = 20;                 // ʱ������Ϊ20ns

//reg define
reg  sys_clk;                      // ʱ���ź�
    reg  sys_rst_n;                    // ��λ�ź�

        //wire define
    wire  [3:0]  led;

    //*****************************************************
        //**                    main code
        //*****************************************************

        //�������źų�ʼֵ
        initial begin
        sys_clk            = 1'b0;
        sys_rst_n          = 1'b0;     // ��λ
            #(T+1)  sys_rst_n  = 1'b1;     // �ڵ�21ns��ʱ��λ�ź��ź�����
        end

        //50Mhz��ʱ�ӣ�������Ϊ1/50Mhz=20ns,����ÿ10ns����ƽȡ��һ��
        always #(T/2) sys_clk = ~sys_clk;

        //����ledģ��
        flow_led  u0_flow_led (
            .sys_clk     (sys_clk  ),
            .sys_rst_n   (sys_rst_n),
            .led         (led      )
        );

        endmodule