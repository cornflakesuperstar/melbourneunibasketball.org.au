student_fee = 70
non_student_fee = 110
representative_fee = 20

rebuild_price = ->
  cost = 0
  fee_breakdown = []
  switch $("#eligibility_clause").val()
    when ""
      cost = -1
    when "enrolled_student_mu"
      fee_breakdown.push('$' + student_fee + ' for a Melbourne Uni student')
      cost += student_fee
    else
      fee_breakdown.push('$' + non_student_fee + ' for an eligible non-student')
      cost += non_student_fee
  if $('#member_representative_player').val() == 'true'
    fee_breakdown.push('$' + representative_fee + ' surcharge for playing in a representative grade')
    cost += representative_fee
  $('#membership_fee_dollars').text "$" + cost
  $('#member_amount_paid').val(cost)
  if cost != -1 and fee_breakdown.length > 1
     $('#membership_breakdown').text "ie. " + fee_breakdown.join(', ')
  else
     $('#membership_breakdown').text ""

rebuild_eligibility_clause = ->
  if ["life_member", "deferred_student", ""].indexOf($('#member_eligibility_clause').val()) >= 0
    $('#member_eligibility_justification').hide()
    $('#eligibility_justification_label').hide()
  else
    $('#eligibility_justification_label').show() 
    $('#member_eligibility_justification').show()
    switch $('#member_eligibility_clause').val()
      when "enrolled_student_mu"
        $('#eligibility_justification_label').text("Student number")
      when "enrolled_student_elsewhere"
        $('#eligibility_justification_label').text("Institution name")
      when "university_graduate"
        $('#eligibility_justification_label').text('University, Degree and Final Year')
      when "university_staff"
        $('#eligibility_justification_label').text('Department')
      when "working_on_site"
        $('#eligibility_justification_label').text('Employed by')
      when "college_affiliation"
        $('#eligibility_justification_label').text('College')
      when "immediate_family"
        $('#eligibility_justification_label').text('Eligible Family Member\'s name')
      when "directors_discretion"
        $('#eligibility_justification_label').text('Director\'s name and justification')
    if !$('#member_eligibility_justification').val()
      $('#member_eligibility_justification').focus()

rebuild_steps = (button_value) ->        
  if button_value == 'paypal'
    $('#bank_transfer_instructions').hide()
    $('#paypal_instructions').show()
    $('#submit_button').val('Take me to Paypal')
  else if button_value == 'bank_transfer'
    $('#paypal_instructions').hide()
    $('#bank_transfer_instructions').show()
    $('#submit_button').val('Submit')
        
jQuery ($) ->
  $("div.btn-group").each ->
    group = $(this)
    form = group.parents("form").eq(0)
    name = group.attr("data-toggle-name")
    hidden = $("input[name=\"" + name + "\"]", form)
    $("button", group).each ->
      button = $(this)
      button.bind "click", ->
        hidden.val $(this).val()
        if($(this).attr('id') == 'existing_member')
          $("#introductory_source").hide()
          $("#singlet_numbers").show()
        else if($(this).attr('id') == 'is_new_member')
          $("#singlet_numbers").hide()
          $("#introductory_source").show()
        else if($(this).attr('id') == 'representative_button')
          rebuild_price()
        else if($(this).attr('id') == 'non_representative_button')
          rebuild_price()
      button.addClass "active"  if button.val() is hidden.val()

  rebuild_steps jQuery("#payment_controls input:checked").val()
  $('#payment_controls input:radio').change ->
    rebuild_steps $(this).val()

  rebuild_eligibility_clause()
  
  $('#member_eligibility_clause').change ->
    rebuild_price()
    rebuild_eligibility_clause()

  $('#populate_fields').bind "click", ->
    $('#member_eligibility_clause').val('university_graduate')
    $('#member_eligibility_justification').show().val('RMIT')
    $('#member_given_name').val('John')
    $('#member_family_name').val('Smith')
    $('#member_email').val('someone@somewhere.com')
    $('#member_postal_address').val('1 Tin Alley lane, Melbourne University, Carlton 3004')
    $('#gender_male').click()
    $('#member_date_of_birth').val('01/01/2013')
    $('#member_phone_number_mobile').val('0400 123 456')
    $('#member_phone_number_other').val('9310 0123')
    rebuild_price()
    false
    