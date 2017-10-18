/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : zjtx

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-10-18 22:56:33
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_b_assets_liabilities`
-- ----------------------------
DROP TABLE IF EXISTS `t_b_assets_liabilities`;
CREATE TABLE `t_b_assets_liabilities` (
  `id` int(11) DEFAULT NULL COMMENT '资产负债表id',
  `report_date` date DEFAULT NULL COMMENT '报表日期',
  `monetary_unit` int(11) DEFAULT NULL COMMENT '单位（1：元 2：万元）',
  `current_assets` decimal(10,0) DEFAULT NULL COMMENT '流动资产',
  `cash_assets` decimal(10,0) DEFAULT NULL COMMENT '货币资金',
  `trading_assets` int(11) DEFAULT NULL COMMENT '交易性金融资产',
  `derivative_assets` int(11) DEFAULT NULL COMMENT '衍生金融资产',
  `notes_receivable` int(11) DEFAULT NULL COMMENT '应收票据',
  `account_receivable` int(11) DEFAULT NULL COMMENT '应收账款',
  `advance_pay` int(11) DEFAULT NULL COMMENT '预付款项',
  `interest_receivable` int(11) DEFAULT NULL COMMENT '应收利息',
  `dividend_receivable` int(11) DEFAULT NULL COMMENT '应收股利',
  `other_account_receivable` int(11) DEFAULT NULL COMMENT '其他应收款',
  `redemptory_monetary_capital_for_sale` int(11) DEFAULT NULL COMMENT '买入返售金融资产',
  `stock` int(11) DEFAULT NULL COMMENT '存货',
  `partition_available_sale_assets` int(11) DEFAULT NULL COMMENT '划分为持有待售的资产',
  `unCurrent_assets_expire_one_year` int(11) DEFAULT NULL COMMENT '一年内到期的非流动资产',
  `unamortized_expense` int(11) DEFAULT NULL COMMENT '待摊费用',
  `pending_current_assets_loss` int(11) DEFAULT NULL COMMENT '待处理流动资产损益',
  `other_current_assets` int(11) DEFAULT NULL COMMENT '其他流动资产',
  `total_current_assets` int(11) DEFAULT NULL COMMENT '流动资产合计',
  `un_current_assets` int(11) DEFAULT NULL COMMENT '非流动资产',
  `grant_loans_pad_money` int(11) DEFAULT NULL COMMENT '发放贷款及垫款',
  `available_sale_assets` int(11) DEFAULT NULL COMMENT '可供出售金融资产',
  `hold_to_expire_assets` int(11) DEFAULT NULL COMMENT '持有至到期投资',
  `long_receivable_account` int(11) DEFAULT NULL COMMENT '长期应收款',
  `long_stock_equity_invest` int(11) DEFAULT NULL COMMENT '长期股权投资',
  `investment_real_estate` int(11) DEFAULT NULL COMMENT '投资性房地产',
  `net_fixed_assets` int(11) DEFAULT NULL COMMENT '固定资产净额',
  `construction_progress` int(11) DEFAULT NULL COMMENT '在建工程',
  `engineering_material` int(11) DEFAULT NULL COMMENT '工程物资',
  `fix_assets_clear` int(11) DEFAULT NULL COMMENT '固定资产清理',
  `productbility_assets` int(11) DEFAULT NULL COMMENT '生产性生物资产',
  `public_welfare_assets` int(11) DEFAULT NULL COMMENT '公益性生物资产',
  `oil_assets` int(11) DEFAULT NULL COMMENT '油气资产',
  `intangible_assets` int(11) DEFAULT NULL COMMENT '无形资产',
  `development_expenditure` int(11) DEFAULT NULL COMMENT '开发支出',
  `goodwill` int(11) DEFAULT NULL COMMENT '商誉',
  `long_unamortized_expense` int(11) DEFAULT NULL COMMENT '长期待摊费用',
  `deferred_tax_assets` int(11) DEFAULT NULL COMMENT '递延所得税资产',
  `other_uncurrent_assets` int(11) DEFAULT NULL COMMENT '其他非流动资产',
  `total_uncurrent_assets` int(11) DEFAULT NULL COMMENT '非流动资产合计',
  `total_assets` int(11) DEFAULT NULL COMMENT '资产总计',
  `current_liabilities` int(11) DEFAULT NULL COMMENT '流动负债',
  `short_term_borrowing` int(11) DEFAULT NULL COMMENT '短期借款',
  `trading_liabilities` int(11) DEFAULT NULL COMMENT '交易性金融负债',
  `notes_payable` int(11) DEFAULT NULL COMMENT '应付票据',
  `accounts_payable` int(11) DEFAULT NULL COMMENT '应付账款',
  `advance_receipt` int(11) DEFAULT NULL COMMENT '预收款项',
  `fee_payable` int(11) DEFAULT NULL COMMENT '应付手续费及佣金',
  `salary_payable` int(11) DEFAULT NULL COMMENT '应付职工薪酬',
  `tax_payable` int(11) DEFAULT NULL COMMENT '应交税费',
  `interest_payable` int(11) DEFAULT NULL COMMENT '应付利息',
  `dividend_payable` int(11) DEFAULT NULL COMMENT '应付股利',
  `other_account_payable` int(11) DEFAULT NULL COMMENT '其他应付款',
  `accrued_expenses` int(11) DEFAULT NULL COMMENT '预提费用',
  `deferred_income_one_year` int(11) DEFAULT NULL COMMENT '一年内的递延收益',
  `short_term_bond_payable` int(11) DEFAULT NULL COMMENT '应付短期债券',
  `uncurrent_liabilities_expire_one_year` int(11) DEFAULT NULL COMMENT '一年内到期的非流动负债',
  `ohter_current_liabilities` int(11) DEFAULT NULL COMMENT '其他流动负债',
  `total_current_liabilities` int(11) DEFAULT NULL COMMENT '流动负债合计',
  `long_term_borrowing` int(11) DEFAULT NULL COMMENT '长期借款',
  `bond_payable` int(11) DEFAULT NULL COMMENT '应付债券',
  `long_term_account_payable` int(11) DEFAULT NULL COMMENT '长期应付款',
  `long_term_salary_payable` int(11) DEFAULT NULL COMMENT '长期应付职工薪酬',
  `special_account_payable` int(11) DEFAULT NULL COMMENT '专项应付款',
  `predict_uncurrent_liabilities` int(11) DEFAULT NULL COMMENT '预计非流动负债',
  `deferred_tax_liabilities` int(11) DEFAULT NULL COMMENT '递延所得税负债',
  `long_deferred_income` int(11) DEFAULT NULL COMMENT '长期递延收益',
  `other_uncurrent_liabilities` int(11) DEFAULT NULL COMMENT '其他非流动负债',
  `total_uncurrent_liabilities` int(11) DEFAULT NULL COMMENT '非流动负债合计',
  `total_liabilities` int(11) DEFAULT NULL COMMENT '负债合计',
  `owner_equity` int(11) DEFAULT NULL COMMENT '所有者权益',
  `paidin_capita` int(11) DEFAULT NULL COMMENT '实收资本(或股本)',
  `capital_reserve` int(11) DEFAULT NULL COMMENT '资本公积',
  `treasury_stock` int(11) DEFAULT NULL COMMENT '库存股',
  `other_comprehensive_income` int(11) DEFAULT NULL COMMENT '其他综合收益',
  `special_reserves` int(11) DEFAULT NULL COMMENT '专项储备',
  `surplus_reserves` int(11) DEFAULT NULL COMMENT '盈余公积',
  `general_risk_capital_pre` int(11) DEFAULT NULL COMMENT '一般风险准备',
  `undistributed_profit` int(11) DEFAULT NULL COMMENT '未分配利润',
  `total_parent_company_shareholder_profit` int(11) DEFAULT NULL COMMENT '归属于母公司股东权益合计',
  `minority_shareholder_profit` int(11) DEFAULT NULL COMMENT '少数股东权益',
  `total_owner_profit` int(11) DEFAULT NULL COMMENT '所有者权益(或股东权益)合计',
  `total_liabilities_owner_profit` int(11) DEFAULT NULL COMMENT '负债和所有者权益(或股东权益)总计'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产负债表';

-- ----------------------------
-- Records of t_b_assets_liabilities
-- ----------------------------

-- ----------------------------
-- Table structure for `t_b_cash_flow`
-- ----------------------------
DROP TABLE IF EXISTS `t_b_cash_flow`;
CREATE TABLE `t_b_cash_flow` (
  `id` int(11) DEFAULT NULL COMMENT '现金流量表id',
  `report_date` date DEFAULT NULL COMMENT '报表日期',
  `monetary_unit` int(11) DEFAULT NULL COMMENT '单位(1：元 2：万元)',
  `total_operate_activity_cash_flow` decimal(10,0) DEFAULT NULL COMMENT '经营活动产生的总现金流量',
  `sell_goods_labour_cash` decimal(10,0) DEFAULT NULL COMMENT '销售商品、提供劳务收到的现金',
  `receive_tax` decimal(10,0) DEFAULT NULL COMMENT '收到的税费返还',
  `receive_operate_activit_cash` decimal(10,0) DEFAULT NULL COMMENT '收到的其他与经营活动有关的现金',
  `operate_activit_subtotal_inflow_cash` decimal(10,0) DEFAULT NULL COMMENT '经营活动现金流入小计',
  `buy_goods_labour_cash` decimal(10,0) DEFAULT NULL COMMENT '购买商品、接受劳务支付的现金',
  `pay_to_worker_cash` decimal(10,0) DEFAULT NULL COMMENT '支付给职工以及为职工支付的现金',
  `pay_tax` decimal(10,0) DEFAULT NULL COMMENT '支付的各项税费',
  `pay_operate_activit_cash` decimal(10,0) DEFAULT NULL COMMENT '支付的其他与经营活动有关的现金',
  `operate_activit_subtotal_outflow_cash` decimal(10,0) DEFAULT NULL COMMENT '经营活动现金流出小计',
  `operate_activit_net_cash_flow` decimal(10,0) DEFAULT NULL COMMENT '经营活动产生的现金流量净额',
  `total_invest_activity_cash_flow` decimal(10,0) DEFAULT NULL COMMENT '投资活动产生的现金流量',
  `refund_invest_cash` decimal(10,0) DEFAULT NULL COMMENT '收回投资所收到的现金',
  `receive_income_invest_cash` decimal(10,0) DEFAULT NULL COMMENT '取得投资收益所收到的现金',
  `dispose_fix_intangible_other_net_cash` decimal(10,0) DEFAULT NULL COMMENT '处置固定资产、无形资产和其他长期资产所收回的现金净额',
  `dispose_subsidiary_other_net_cash` decimal(10,0) DEFAULT NULL COMMENT '处置子公司及其他营业单位收到的现金净额',
  `receive_invest_activit_cash` decimal(10,0) DEFAULT NULL COMMENT '收到的其他与投资活动有关的现金',
  `invest_activity_subtotal_inflow_cash` decimal(10,0) DEFAULT NULL COMMENT '投资活动现金流入小计',
  `build_fix_intangible_other_net_cash` decimal(10,0) DEFAULT NULL COMMENT '购建固定资产、无形资产和其他长期资产所支付的现金',
  `invest_pay_cash` decimal(10,0) DEFAULT NULL COMMENT '投资所支付的现金',
  `receive_subsidiary_orther_pay_net_cash` decimal(10,0) DEFAULT NULL COMMENT '取得子公司及其他营业单位支付的现金净额',
  `pay_invest_activit_cash` decimal(10,0) DEFAULT NULL COMMENT '支付的其他与投资活动有关的现金',
  `invest_activit_subtotal_outflow_cash` decimal(10,0) DEFAULT NULL COMMENT '投资活动现金流出小计',
  `invest_activit_net_cash_flow` decimal(10,0) DEFAULT NULL COMMENT '投资活动产生的现金流量净额',
  `total_financing_activit_cash_flow` decimal(10,0) DEFAULT NULL COMMENT '总筹资活动产生的现金流量',
  `invest_receive_cash` decimal(10,0) DEFAULT NULL COMMENT '吸收投资收到的现金',
  `subsidiary_receive_stock_cash` decimal(10,0) DEFAULT NULL COMMENT '子公司吸收少数股东投资收到的现金',
  `receive_borrow_cash` decimal(10,0) DEFAULT NULL COMMENT '取得借款收到的现金',
  `receive_bond_cash` decimal(10,0) DEFAULT NULL COMMENT '发行债券收到的现金',
  `receive_financing_activit_cash` decimal(10,0) DEFAULT NULL COMMENT '收到其他与筹资活动有关的现金',
  `financing_activity_subtotal_inflow_cash` decimal(10,0) DEFAULT NULL COMMENT '筹资活动现金流入小计',
  `repay_debt_cash` decimal(10,0) DEFAULT NULL COMMENT '偿还债务支付的现金',
  `repay_debt_profit_interest_cash` decimal(10,0) DEFAULT NULL COMMENT '分配股利、利润或偿付利息所支付的现金',
  `subsidiary_pay_stock_debt` decimal(10,0) DEFAULT NULL COMMENT '子公司支付给少数股东的股利、利润',
  `pay_financing_activit_cash` decimal(10,0) DEFAULT NULL COMMENT '支付其他与筹资活动有关的现金',
  `financing_activity_subtotal_outflow_cash` decimal(10,0) DEFAULT NULL COMMENT '筹资活动现金流出小计',
  `financing_activity_net_cash_flow` decimal(10,0) DEFAULT NULL COMMENT '筹资活动产生的现金流量净额',
  `exchange_rate_cash_effect` decimal(10,0) DEFAULT NULL COMMENT '汇率变动对现金及现金等价物的影响',
  `cash_equ_net_increase_quota` decimal(10,0) DEFAULT NULL COMMENT '现金及现金等价物净增加额',
  `opening_cash_equivalent_balance` decimal(10,0) DEFAULT NULL COMMENT '期初现金及现金等价物余额',
  `ending_cash_equ_balance` decimal(10,0) DEFAULT NULL COMMENT '期末现金及现金等价物余额',
  `annotation` varchar(100) DEFAULT NULL COMMENT '附注',
  `net_profit` decimal(10,0) DEFAULT NULL COMMENT '净利润',
  `minority_shareholder_equity` decimal(10,0) DEFAULT NULL COMMENT '少数股东权益',
  `unidentified_invest_loss` decimal(10,0) DEFAULT NULL COMMENT '未确认的投资损失',
  `property_depreciation_prepare` decimal(10,0) DEFAULT NULL COMMENT '资产减值准备',
  `fix_oil_product_deprecition` decimal(10,0) DEFAULT NULL COMMENT '固定资产折旧、油气资产折耗、生产性物资折旧',
  `intangible_assets_amortization` decimal(10,0) DEFAULT NULL COMMENT '无形资产摊销',
  `long_deferred_expense_amortization` decimal(10,0) DEFAULT NULL COMMENT '长期待摊费用摊销',
  `deferred_expense_sub` decimal(10,0) DEFAULT NULL COMMENT '待摊费用的减少',
  `drawing_expense_add` decimal(10,0) DEFAULT NULL COMMENT '预提费用的增加',
  `dispose_fix_intangible_other_loss` decimal(10,0) DEFAULT NULL COMMENT '处置固定资产、无形资产和其他长期资产的损失',
  `fix_assets_scrap_loss` decimal(10,0) DEFAULT NULL COMMENT '固定资产报废损失',
  `fair_val_variatio_loss` decimal(10,0) DEFAULT NULL COMMENT '公允价值变动损失',
  `deferred_earnings_add` decimal(10,0) DEFAULT NULL COMMENT '递延收益增加（减：减少）',
  `predict_liabilities` decimal(10,0) DEFAULT NULL COMMENT '预计负债',
  `financial_expense` decimal(10,0) DEFAULT NULL COMMENT '财务费用',
  `invest_loss` decimal(10,0) DEFAULT NULL COMMENT '投资损失',
  `deferred_tax_assets_sub` decimal(10,0) DEFAULT NULL COMMENT '递延所得税资产减少',
  `deferred_tax_liabilities_add` decimal(10,0) DEFAULT NULL COMMENT '递延所得税负债增加',
  `stock_sub` decimal(10,0) DEFAULT NULL COMMENT '存货的减少',
  `receivables_sub` decimal(10,0) DEFAULT NULL COMMENT '经营性应收项目的减少',
  `payables_add` decimal(10,0) DEFAULT NULL COMMENT '经营性应付项目的增加',
  `done_unbalanced_sub` decimal(10,0) DEFAULT NULL COMMENT '已完工尚未结算款的减少(减:增加)',
  `balanced_undone_add` decimal(10,0) DEFAULT NULL COMMENT '已结算尚未完工款的增加(减:减少)',
  `others` decimal(10,0) DEFAULT NULL COMMENT '其他',
  `convert_debt_to_capital` decimal(10,0) DEFAULT NULL COMMENT '债务转为资本',
  `convertible_bond_one_year` decimal(10,0) DEFAULT NULL COMMENT '一年内到期的可转换公司债券',
  `financing_to_fix_asset` decimal(10,0) DEFAULT NULL COMMENT '融资租入固定资产',
  `cash_ending_balance` decimal(10,0) DEFAULT NULL COMMENT '现金的期末余额',
  `cash_initial_balance` decimal(10,0) DEFAULT NULL COMMENT '现金的期初余额',
  `cash_equivalent_ending_balance` decimal(10,0) DEFAULT NULL COMMENT '现金等价物的期末余额',
  `cash_equivalent_initial_balance` decimal(10,0) DEFAULT NULL COMMENT '现金等价物的期初余额',
  `cash_equivalent_net_increase_quota` decimal(10,0) DEFAULT NULL COMMENT '现金及现金等价物的净增加额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='现金流量表';

-- ----------------------------
-- Records of t_b_cash_flow
-- ----------------------------

-- ----------------------------
-- Table structure for `t_b_income`
-- ----------------------------
DROP TABLE IF EXISTS `t_b_income`;
CREATE TABLE `t_b_income` (
  `id` int(11) NOT NULL COMMENT '主键id',
  `report_date` date DEFAULT NULL COMMENT '报表日期(精确到天)',
  `monetary_unit` int(11) DEFAULT NULL COMMENT '单位(1：元 2：万元)',
  `total_operating_income` decimal(10,0) DEFAULT NULL COMMENT '营业总收入',
  `operating_income` decimal(10,0) DEFAULT NULL COMMENT '营业收入',
  `total_operating_cost` decimal(10,0) DEFAULT NULL COMMENT '营业总成本',
  `operating_cost` decimal(10,0) DEFAULT NULL COMMENT '营业成本',
  `oparating_tax_annex` decimal(10,0) DEFAULT NULL COMMENT '营业税金及附加',
  `selling_expenses` decimal(10,0) DEFAULT NULL COMMENT '销售费用',
  `adminisstrative_expenses` decimal(10,0) DEFAULT NULL COMMENT '管理费用',
  `financial_expense` decimal(10,0) DEFAULT NULL COMMENT '财务费用\n',
  `assets_devaluation_loss` decimal(10,0) DEFAULT NULL COMMENT '资产减值损失',
  `fair_val_variation_income` decimal(10,0) DEFAULT NULL COMMENT '公允价值变动收益',
  `investments_income` decimal(10,0) DEFAULT NULL COMMENT '投资收益',
  `investments_joint_venture_income` decimal(10,0) DEFAULT NULL COMMENT '对联营企业和合营企业的投资收益',
  `exchange_income` decimal(10,0) DEFAULT NULL COMMENT '汇兑收益\n',
  `operating_profit` decimal(10,0) DEFAULT NULL COMMENT '营业总利润',
  `nonbusiness_income` decimal(10,0) DEFAULT NULL COMMENT '营业外收入',
  `expenditure_nonbusiness` decimal(10,0) DEFAULT NULL COMMENT '营业外支出',
  `non_current_loss` decimal(10,0) DEFAULT NULL COMMENT '非流动资产处置损失',
  `total_profit` decimal(10,0) DEFAULT NULL COMMENT '利润总额',
  `income_tax_expenses` decimal(10,0) DEFAULT NULL COMMENT '所得税费用',
  `total_net_profit` decimal(10,0) DEFAULT NULL COMMENT '总净利润',
  `parent_company_net_profit` decimal(10,0) DEFAULT NULL COMMENT '归属于母公司所有者的净利润',
  `minority_interest_loss` decimal(10,0) DEFAULT NULL COMMENT '少数股东损益',
  `eps` decimal(10,0) DEFAULT NULL COMMENT '每股收益',
  `basic_eps` decimal(10,0) DEFAULT NULL COMMENT '基本每股收益(元/股)',
  `diluted_eps` decimal(10,0) DEFAULT NULL COMMENT '稀释每股收益(元/股)',
  `oci` decimal(10,0) DEFAULT NULL COMMENT '其他综合收益',
  `total_comprehensive_income` decimal(10,0) DEFAULT NULL COMMENT '综合收益总额',
  `total_parent_company_income` decimal(10,0) DEFAULT NULL COMMENT '归属于母公司所有者的综合收益总额',
  `totalInority_stock_income` decimal(10,0) DEFAULT NULL COMMENT '归属于少数股东的综合收益总额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='利润表';

-- ----------------------------
-- Records of t_b_income
-- ----------------------------
