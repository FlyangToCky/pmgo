package com.pmgo.common.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BasePmRequirement<M extends BasePmRequirement<M>> extends Model<M> implements IBean {

	public M setId(java.lang.String id) {
		set("id", id);
		return (M)this;
	}

	public java.lang.String getId() {
		return get("id");
	}

	public M setCode(java.lang.String code) {
		set("code", code);
		return (M)this;
	}

	public java.lang.String getCode() {
		return get("code");
	}

	public M setModule(java.lang.String module) {
		set("module", module);
		return (M)this;
	}

	public java.lang.String getModule() {
		return get("module");
	}

	public M setChildModule(java.lang.String childModule) {
		set("child_module", childModule);
		return (M)this;
	}

	public java.lang.String getChildModule() {
		return get("child_module");
	}

	public M setFunction(java.lang.String function) {
		set("function", function);
		return (M)this;
	}

	public java.lang.String getFunction() {
		return get("function");
	}

	public M setDescAssignment(java.lang.String descAssignment) {
		set("desc_assignment", descAssignment);
		return (M)this;
	}

	public java.lang.String getDescAssignment() {
		return get("desc_assignment");
	}

	public M setDescValue(java.lang.String descValue) {
		set("desc_value", descValue);
		return (M)this;
	}

	public java.lang.String getDescValue() {
		return get("desc_value");
	}

	public M setRequirementLevel(java.lang.String requirementLevel) {
		set("requirement_level", requirementLevel);
		return (M)this;
	}

	public java.lang.String getRequirementLevel() {
		return get("requirement_level");
	}

	public M setRequirementClass(java.lang.String requirementClass) {
		set("requirement_class", requirementClass);
		return (M)this;
	}

	public java.lang.String getRequirementClass() {
		return get("requirement_class");
	}

	public M setPriority(java.lang.String priority) {
		set("priority", priority);
		return (M)this;
	}

	public java.lang.String getPriority() {
		return get("priority");
	}

	public M setTimeCommit(java.util.Date timeCommit) {
		set("time_commit", timeCommit);
		return (M)this;
	}

	public java.util.Date getTimeCommit() {
		return get("time_commit");
	}

	public M setTimeInput(java.util.Date timeInput) {
		set("time_input", timeInput);
		return (M)this;
	}

	public java.util.Date getTimeInput() {
		return get("time_input");
	}

	public M setTimePublish(java.util.Date timePublish) {
		set("time_publish", timePublish);
		return (M)this;
	}

	public java.util.Date getTimePublish() {
		return get("time_publish");
	}

	public M setPersonCommit(java.lang.String personCommit) {
		set("person_commit", personCommit);
		return (M)this;
	}

	public java.lang.String getPersonCommit() {
		return get("person_commit");
	}

	public M setPersonDirector(java.lang.String personDirector) {
		set("person_director", personDirector);
		return (M)this;
	}

	public java.lang.String getPersonDirector() {
		return get("person_director");
	}

	public M setPersonTester(java.lang.String personTester) {
		set("person_tester", personTester);
		return (M)this;
	}

	public java.lang.String getPersonTester() {
		return get("person_tester");
	}

	public M setPersonOperate(java.lang.String personOperate) {
		set("person_operate", personOperate);
		return (M)this;
	}

	public java.lang.String getPersonOperate() {
		return get("person_operate");
	}

	public M setCountDevelop(java.lang.String countDevelop) {
		set("count_develop", countDevelop);
		return (M)this;
	}

	public java.lang.String getCountDevelop() {
		return get("count_develop");
	}

	public M setCostPerformance(java.lang.String costPerformance) {
		set("cost_performance", costPerformance);
		return (M)this;
	}

	public java.lang.String getCostPerformance() {
		return get("cost_performance");
	}

	public M setState(java.lang.String state) {
		set("state", state);
		return (M)this;
	}

	public java.lang.String getState() {
		return get("state");
	}

	public M setMem(java.lang.String mem) {
		set("mem", mem);
		return (M)this;
	}

	public java.lang.String getMem() {
		return get("mem");
	}

}
